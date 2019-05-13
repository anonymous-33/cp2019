/* -*- mode: C++; c-basic-offset: 2; indent-tabs-mode: nil -*- */
/*
 *  Main authors:
 *     Christian Schulte <schulte@gecode.org>
 *
 *  Copyright:
 *     Christian Schulte, 2003
 *
 *  This file is part of Gecode, the generic constraint
 *  development environment:
 *     http://www.gecode.org
 *
 *  Permission is hereby granted, free of charge, to any person obtaining
 *  a copy of this software and associated documentation files (the
 *  "Software"), to deal in the Software without restriction, including
 *  without limitation the rights to use, copy, modify, merge, publish,
 *  distribute, sublicense, and/or sell copies of the Software, and to
 *  permit persons to whom the Software is furnished to do so, subject to
 *  the following conditions:
 *
 *  The above copyright notice and this permission notice shall be
 *  included in all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 *  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 *  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 *  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 *  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 *  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 *  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

namespace Gecode { namespace Int { namespace Rel {

  /*
   * Lexical order propagator
   */
  template<class VX, class VY>
  inline
  LexLqLe<VX,VY>::LexLqLe(Home home,
                          ViewArray<VX>& x0, ViewArray<VY>& y0, bool s)
    : Propagator(home), x(x0), y(y0), strict(s) {
    x.subscribe(home, *this, PC_INT_BND);
    y.subscribe(home, *this, PC_INT_BND);
  }

  template<class VX, class VY>
  forceinline
  LexLqLe<VX,VY>::LexLqLe(Space& home, LexLqLe<VX,VY>& p)
    : Propagator(home,p), strict(p.strict) {
    x.update(home,p.x);
    y.update(home,p.y);
  }

  template<class VX, class VY>
  Actor*
  LexLqLe<VX,VY>::copy(Space& home) {
    return new (home) LexLqLe<VX,VY>(home,*this);
  }

  template<class VX, class VY>
  PropCost
  LexLqLe<VX,VY>::cost(const Space&, const ModEventDelta&) const {
    return PropCost::linear(PropCost::LO, x.size());
  }

  template<class VX, class VY>
  void
  LexLqLe<VX,VY>::reschedule(Space& home) {
    x.reschedule(home,*this,PC_INT_BND);
    y.reschedule(home,*this,PC_INT_BND);
  }

  template<class VX, class VY>
  forceinline size_t
  LexLqLe<VX,VY>::dispose(Space& home) {
    assert(!home.failed());
    x.cancel(home,*this,PC_INT_BND);
    y.cancel(home,*this,PC_INT_BND);
    (void) Propagator::dispose(home);
    return sizeof(*this);
  }

  template<class VX, class VY>
  ExecStatus
  LexLqLe<VX,VY>::propagate(Space& home, const ModEventDelta&) {
    /*
     * State 1
     *
     */
    {
      int i = 0;
      int n = x.size();

      while ((i < n) && (x[i].min() == y[i].max())) {
        // case: =, >=
        GECODE_ME_CHECK(x[i].lq(home,y[i].max()));
        GECODE_ME_CHECK(y[i].gq(home,x[i].min()));
        i++;
      }

      if (i == n) // case: $
        return strict ? ES_FAILED : home.ES_SUBSUMED(*this);

      // Possible cases left: <, <=, > (yields failure), ?
      GECODE_ME_CHECK(x[i].lq(home,y[i].max()));
      GECODE_ME_CHECK(y[i].gq(home,x[i].min()));

      if (x[i].max() < y[i].min()) // case: < (after tell)
        return home.ES_SUBSUMED(*this);

      // x[i] can never be equal to y[i] (otherwise: >=)
      assert(!(x[i].assigned() && y[i].assigned() &&
               x[i].val() == y[i].val()));
      // Remove all elements between 0...i-1 as they are assigned and equal
      x.drop_fst(i); y.drop_fst(i);
      // After this, execution continues at [1]
    }

    /*
     * State 2
     *   prefix: (?|<=)
     *
     */
    {
      int i = 1;
      int n = x.size();

      while ((i < n) &&
             (x[i].min() == y[i].max()) &&
             (x[i].max() == y[i].min())) { // case: =
        assert(x[i].assigned() && y[i].assigned() &&
               (x[i].val() == y[i].val()));
        i++;
      }

      if (i == n) { // case: $
        if (strict)
          goto rewrite_le;
        else
          goto rewrite_lq;
      }

      if (x[i].max() < y[i].min()) // case: <
        goto rewrite_lq;

      if (x[i].min() > y[i].max()) // case: >
        goto rewrite_le;

      if (i > 1) {
        // Remove equal elements [1...i-1], keep element [0]
        x[i-1]=x[0]; x.drop_fst(i-1);
        y[i-1]=y[0]; y.drop_fst(i-1);
      }
    }

    if (x[1].max() <= y[1].min()) {
      // case: <= (invariant: not =, <)
      /*
       * State 3
       *   prefix: (?|<=),<=
       *
       */
      int i = 2;
      int n = x.size();

      while ((i < n) && (x[i].max() == y[i].min())) // case: <=, =
        i++;

      if (i == n) { // case: $
        if (strict)
          return ES_FIX;
        else
          goto rewrite_lq;
      }

      if (x[i].max() < y[i].min()) // case: <
        goto rewrite_lq;

      if (x[i].min() > y[i].max()) { // case: >
        // Eliminate [i]...[n-1]
        for (int j=i; j<n; j++) {
          x[j].cancel(home,*this,PC_INT_BND);
          y[j].cancel(home,*this,PC_INT_BND);
        }
        x.size(i); y.size(i);
        strict = true;
      }

      return ES_FIX;
    }

    if (x[1].min() >= y[1].max()) {
      // case: >= (invariant: not =, >)
      /*
       * State 4
       *   prefix: (?|<=) >=
       *
       */
      int i = 2;
      int n = x.size();

      while ((i < n) && (x[i].min() == y[i].max()))
        // case: >=, =
        i++;

      if (i == n) { // case: $
        if (strict)
          goto rewrite_le;
        else
          return ES_FIX;
      }

      if (x[i].min() > y[i].max()) // case: >
        goto rewrite_le;

      if (x[i].max() < y[i].min()) { // case: <
        // Eliminate [i]...[n-1]
        for (int j=i; j<n; j++) {
          x[j].cancel(home,*this,PC_INT_BND);
          y[j].cancel(home,*this,PC_INT_BND);
        }
        x.size(i); y.size(i);
        strict = false;
      }

      return ES_FIX;
    }

    return ES_FIX;

  rewrite_le:
    GECODE_REWRITE(*this,(Le<VX,VY>::post(home(*this),x[0],y[0])));
  rewrite_lq:
    GECODE_REWRITE(*this,(Lq<VX,VY>::post(home(*this),x[0],y[0])));
  }

  template<class VX, class VY>
  ExecStatus
  LexLqLe<VX,VY>::post(Home home,
                      ViewArray<VX>& x, ViewArray<VY>& y, bool strict) {
    if (x.size() < y.size()) {
      y.size(x.size()); strict=false;
    } else if (x.size() > y.size()) {
      x.size(y.size()); strict=true;
    }
    if (x.size() == 0)
      return strict ? ES_FAILED : ES_OK;
    if (x.size() == 1) {
      if (strict)
        return Le<VX,VY>::post(home,x[0],y[0]);
      else
        return Lq<VX,VY>::post(home,x[0],y[0]);
    }
    (void) new (home) LexLqLe<VX,VY>(home,x,y,strict);
    return ES_OK;
  }


  /*
   * Lexical disequality propagator
   */
  template<class VX, class VY>
  forceinline
  LexNq<VX,VY>::LexNq(Home home, ViewArray<VX>& xv, ViewArray<VY>& yv)
    : Propagator(home),
      x0(xv[xv.size()-2]), y0(yv[xv.size()-2]),
      x1(xv[xv.size()-1]), y1(yv[xv.size()-1]),
      x(xv), y(yv) {
    int n = x.size();
    assert(n > 1);
    assert(n == y.size());
    x.size(n-2); y.size(n-2);
    x0.subscribe(home,*this,PC_INT_VAL); y0.subscribe(home,*this,PC_INT_VAL);
    x1.subscribe(home,*this,PC_INT_VAL); y1.subscribe(home,*this,PC_INT_VAL);
  }

  template<class VX, class VY>
  PropCost
  LexNq<VX,VY>::cost(const Space&, const ModEventDelta&) const {
    return PropCost::binary(PropCost::HI);
  }

  template<class VX, class VY>
  void
  LexNq<VX,VY>::reschedule(Space& home) {
    x0.reschedule(home,*this,PC_INT_VAL);
    y0.reschedule(home,*this,PC_INT_VAL);
    x1.reschedule(home,*this,PC_INT_VAL);
    y1.reschedule(home,*this,PC_INT_VAL);
  }

  template<class VX, class VY>
  forceinline
  LexNq<VX,VY>::LexNq(Space& home, LexNq<VX,VY>& p)
    : Propagator(home,p) {
    x0.update(home,p.x0); y0.update(home,p.y0);
    x1.update(home,p.x1); y1.update(home,p.y1);
    x.update(home,p.x); y.update(home,p.y);
  }

  template<class VX, class VY>
  Actor*
  LexNq<VX,VY>::copy(Space& home) {
    int n = x.size();
    if (n > 0) {
      // Eliminate all equal views and keep one disequal pair
      for (int i=n; i--; )
        switch (rtest_eq_bnd(x[i],y[i])) {
        case RT_TRUE:
          // Eliminate equal pair
          n--; x[i]=x[n]; y[i]=y[n];
          break;
        case RT_FALSE:
          // Just keep a single disequal pair
          n=1; x[0]=x[i]; y[0]=y[i];
          goto done;
        case RT_MAYBE:
          break;
        default:
          GECODE_NEVER;
        }
    done:
      x.size(n); y.size(n);
    }
    return new (home) LexNq<VX,VY>(home,*this);
  }

  template<class VX, class VY>
  inline ExecStatus
  LexNq<VX,VY>::post(Home home, ViewArray<VX>& x, ViewArray<VY>& y) {
    if (x.size() != y.size())
      return ES_OK;
    int n = x.size();
    if (n > 0) {
      // Eliminate all equal views
      for (int i=n; i--; )
        switch (rtest_eq_dom(x[i],y[i])) {
        case RT_TRUE:
          // Eliminate equal pair
          n--; x[i]=x[n]; y[i]=y[n];
          break;
        case RT_FALSE:
          return ES_OK;
        case RT_MAYBE:
          if (same(x[i],y[i])) {
            // Eliminate equal pair
            n--; x[i]=x[n]; y[i]=y[n];
          }
          break;
        default:
          GECODE_NEVER;
        }
      x.size(n); y.size(n);
    }
    if (n == 0)
      return ES_FAILED;
    if (n == 1)
      return Nq<VX,VY>::post(home,x[0],y[0]);
    (void) new (home) LexNq<VX,VY>(home,x,y);
    return ES_OK;
  }

  template<class VX, class VY>
  forceinline size_t
  LexNq<VX,VY>::dispose(Space& home) {
    x0.cancel(home,*this,PC_INT_VAL); y0.cancel(home,*this,PC_INT_VAL);
    x1.cancel(home,*this,PC_INT_VAL); y1.cancel(home,*this,PC_INT_VAL);
    (void) Propagator::dispose(home);
    return sizeof(*this);
  }

  template<class VX, class VY>
  forceinline ExecStatus
  LexNq<VX,VY>::resubscribe(Space& home,
                            RelTest rt, VX& x0, VY& y0, VX x1, VY y1) {
    if (rt == RT_TRUE) {
      assert(x0.assigned() && y0.assigned());
      assert(x0.val() == y0.val());
      int n = x.size();
      for (int i=n; i--; )
        switch (rtest_eq_dom(x[i],y[i])) {
        case RT_TRUE:
          // Eliminate equal pair
          n--; x[i]=x[n]; y[i]=y[n];
          break;
        case RT_FALSE:
          return home.ES_SUBSUMED(*this);
        case RT_MAYBE:
          // Move to x0, y0 and subscribe
          x0=x[i]; y0=y[i];
          n--; x[i]=x[n]; y[i]=y[n];
          x.size(n); y.size(n);
          x0.subscribe(home,*this,PC_INT_VAL,false);
          y0.subscribe(home,*this,PC_INT_VAL,false);
          return ES_FIX;
        default:
          GECODE_NEVER;
        }
      // No more views to subscribe to left
      GECODE_REWRITE(*this,(Nq<VX,VY>::post(home(*this),x1,y1)));
    }
    return ES_FIX;
  }

  template<class VX, class VY>
  ExecStatus
  LexNq<VX,VY>::propagate(Space& home, const ModEventDelta&) {
    RelTest rt0 = rtest_eq_dom(x0,y0);
    if (rt0 == RT_FALSE)
      return home.ES_SUBSUMED(*this);
    RelTest rt1 = rtest_eq_dom(x1,y1);
    if (rt1 == RT_FALSE)
      return home.ES_SUBSUMED(*this);
    GECODE_ES_CHECK(resubscribe(home,rt0,x0,y0,x1,y1));
    GECODE_ES_CHECK(resubscribe(home,rt1,x1,y1,x0,y0));
    return ES_FIX;
  }


}}}

// STATISTICS: int-prop
