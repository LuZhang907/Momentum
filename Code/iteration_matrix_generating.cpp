#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericMatrix iter_r1(Rcpp::DataFrame dat, int window){
  NumericVector r1 = dat["r1"];
  int n = r1.length();
  NumericMatrix r1_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r1_matrix(i,j) = r1[i+j];
    }
  }
  return r1_matrix;
}

// [[Rcpp::export]]
NumericMatrix iter_r2(Rcpp::DataFrame dat, int window){
  NumericVector r2 = dat["r2"];
  int n = r2.length();
  NumericMatrix r2_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r2_matrix(i,j) = r2[i+j];
    }
  }
  return r2_matrix;
}

// [[Rcpp::export]]
NumericMatrix iter_r3(Rcpp::DataFrame dat, int window){
  NumericVector r3 = dat["r3"];
  int n = r3.length();
  NumericMatrix r3_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r3_matrix(i,j) = r3[i+j];
    }
  }
  return r3_matrix;
}

// [[Rcpp::export]]
NumericMatrix iter_r4(Rcpp::DataFrame dat, int window){
  NumericVector r4 = dat["r4"];
  int n = r4.length();
  NumericMatrix r4_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r4_matrix(i,j) = r4[i+j];
    }
  }
  return r4_matrix;
}

// [[Rcpp::export]]
NumericMatrix iter_r5(Rcpp::DataFrame dat, int window){
  NumericVector r5 = dat["r5"];
  int n = r5.length();
  NumericMatrix r5_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r5_matrix(i,j) = r5[i+j];
    }
  }
  return r5_matrix;
}


// [[Rcpp::export]]
NumericMatrix iter_r6(Rcpp::DataFrame dat, int window){
  NumericVector r6 = dat["r6"];
  int n = r6.length();
  NumericMatrix r6_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r6_matrix(i,j) = r6[i+j];
    }
  }
  return r6_matrix;
}


// [[Rcpp::export]]
NumericMatrix iter_r7(Rcpp::DataFrame dat, int window){
  NumericVector r7 = dat["r7"];
  int n = r7.length();
  NumericMatrix r7_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r7_matrix(i,j) = r7[i+j];
    }
  }
  return r7_matrix;
}

// [[Rcpp::export]]
NumericMatrix iter_r8(Rcpp::DataFrame dat, int window){
  NumericVector r8 = dat["r8"];
  int n = r8.length();
  NumericMatrix r8_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r8_matrix(i,j) = r8[i+j];
    }
  }
  return r8_matrix;
}


// [[Rcpp::export]]
NumericMatrix iter_r9(Rcpp::DataFrame dat, int window){
  NumericVector r9 = dat["r9"];
  int n = r9.length();
  NumericMatrix r9_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r9_matrix(i,j) = r9[i+j];
    }
  }
  return r9_matrix;
}



// [[Rcpp::export]]
NumericMatrix iter_r10(Rcpp::DataFrame dat, int window){
  NumericVector r10 = dat["r10"];
  int n = r10.length();
  NumericMatrix r10_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r10_matrix(i,j) = r10[i+j];
    }
  }
  return r10_matrix;
}


// [[Rcpp::export]]
NumericMatrix iter_r11(Rcpp::DataFrame dat, int window){
  NumericVector r11 = dat["r11"];
  int n = r11.length();
  NumericMatrix r11_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r11_matrix(i,j) = r11[i+j];
    }
  }
  return r11_matrix;
}


// [[Rcpp::export]]
NumericMatrix iter_r12(Rcpp::DataFrame dat, int window){
  NumericVector r12 = dat["r12"];
  int n = r12.length();
  NumericMatrix r12_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r12_matrix(i,j) = r12[i+j];
    }
  }
  return r12_matrix;
}


// [[Rcpp::export]]
NumericMatrix iter_r13(Rcpp::DataFrame dat, int window){
  NumericVector r13 = dat["r13"];
  int n = r13.length();
  NumericMatrix r13_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r13_matrix(i,j) = r13[i+j];
    }
  }
  return r13_matrix;
}



// [[Rcpp::export]]
NumericMatrix iter_r_on(Rcpp::DataFrame dat, int window){
  NumericVector r_on = dat["r_on"];
  int n = r_on.length();
  NumericMatrix r_on_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r_on_matrix(i,j) = r_on[i+j];
    }
  }
  return r_on_matrix;
}


// [[Rcpp::export]]
NumericMatrix iter_r_onfh(Rcpp::DataFrame dat, int window){
  NumericVector r_onfh = dat["r_onfh"];
  int n = r_onfh.length();
  NumericMatrix r_onfh_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r_onfh_matrix(i,j) = r_onfh[i+j];
    }
  }
  return r_onfh_matrix;
}


// [[Rcpp::export]]
NumericMatrix iter_r13_lag(Rcpp::DataFrame dat, int window){
  NumericVector r13_lag = dat["r13_lag"];
  int n = r13_lag.length();
  NumericMatrix r13_lag_matrix(n-window+1,window);
  for( int i=0; i< n-window+1;i++){
    for(int j=0;j<window; j++){
      r13_lag_matrix(i,j) = r13_lag[i+j];
    }
  }
  return r13_lag_matrix;
}

//[[Rcpp::export]]
NumericVector cumRet_calculation(NumericVector direction, NumericVector returns){
  int n = direction.length();
  Rcpp::NumericVector cumRet(n);
  double results = 1.0;
  for(int i=0;i<n;i++){
    results = results*(1+returns(i)*direction(i));
    cumRet(i) = results-1;
  }
  return cumRet;
}

//[[Rcpp::export]]
NumericVector cumRet_benchmark(NumericVector returns){
  int n = returns.length();
  Rcpp::NumericVector cumRet(n);
  double results = 1.0;
  for(int i=0;i<n;i++){
    results = results*(1+returns(i));
    cumRet(i) = results-1;
  }
  return cumRet;
}


//threshold for overnight return
// [[Rcpp::export]]
NumericMatrix mr1_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r1 = dat["r1"];
  NumericVector ron = dat["r_on"];
  int n = r1.length();
  int m = thres.length();
  NumericMatrix mr1(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr1(i,j)=r1[i];
      }else mr1(i,j)=999;
    }
  }
  return mr1;
}

// [[Rcpp::export]]
NumericMatrix mr1_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r1 = dat["r1"];
  NumericVector ron = dat["r_on"];
  int n = r1.length();
  int m = thres.length();
  NumericMatrix mr1(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr1(i,j)=r1[i];
      }else mr1(i,j)=999;
    }
  }
  return mr1;
}

// [[Rcpp::export]]
NumericMatrix mr2_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r2 = dat["r2"];
  NumericVector ron = dat["r_on"];
  int n = r2.length();
  int m = thres.length();
  NumericMatrix mr2(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr2(i,j)=r2[i];
      }else mr2(i,j)=999;
    }
  }
  return mr2;
}

// [[Rcpp::export]]
NumericMatrix mr2_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r2 = dat["r2"];
  NumericVector ron = dat["r_on"];
  int n = r2.length();
  int m = thres.length();
  NumericMatrix mr2(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr2(i,j)=r2[i];
      }else mr2(i,j)=999;
    }
  }
  return mr2;
}

// [[Rcpp::export]]
NumericMatrix mr3_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r3 = dat["r3"];
  NumericVector ron = dat["r_on"];
  int n = r3.length();
  int m = thres.length();
  NumericMatrix mr3(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr3(i,j)=r3[i];
      }else mr3(i,j)=999;
    }
  }
  return mr3;
}

// [[Rcpp::export]]
NumericMatrix mr3_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r3 = dat["r3"];
  NumericVector ron = dat["r_on"];
  int n = r3.length();
  int m = thres.length();
  NumericMatrix mr3(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr3(i,j)=r3[i];
      }else mr3(i,j)=999;
    }
  }
  return mr3;
}

// [[Rcpp::export]]
NumericMatrix mr4_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r4 = dat["r4"];
  NumericVector ron = dat["r_on"];
  int n = r4.length();
  int m = thres.length();
  NumericMatrix mr4(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr4(i,j)=r4[i];
      }else mr4(i,j)=999;
    }
  }
  return mr4;
}

// [[Rcpp::export]]
NumericMatrix mr4_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r4 = dat["r4"];
  NumericVector ron = dat["r_on"];
  int n = r4.length();
  int m = thres.length();
  NumericMatrix mr4(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr4(i,j)=r4[i];
      }else mr4(i,j)=999;
    }
  }
  return mr4;
}

// [[Rcpp::export]]
NumericMatrix mr5_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r5 = dat["r5"];
  NumericVector ron = dat["r_on"];
  int n = r5.length();
  int m = thres.length();
  NumericMatrix mr5(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr5(i,j)=r5[i];
      }else mr5(i,j)=999;
    }
  }
  return mr5;
}

// [[Rcpp::export]]
NumericMatrix mr5_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r5 = dat["r5"];
  NumericVector ron = dat["r_on"];
  int n = r5.length();
  int m = thres.length();
  NumericMatrix mr5(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr5(i,j)=r5[i];
      }else mr5(i,j)=999;
    }
  }
  return mr5;
}

// [[Rcpp::export]]
NumericMatrix mr6_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r6 = dat["r6"];
  NumericVector ron = dat["r_on"];
  int n = r6.length();
  int m = thres.length();
  NumericMatrix mr6(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr6(i,j)=r6[i];
      }else mr6(i,j)=999;
    }
  }
  return mr6;
}

// [[Rcpp::export]]
NumericMatrix mr6_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r6 = dat["r6"];
  NumericVector ron = dat["r_on"];
  int n = r6.length();
  int m = thres.length();
  NumericMatrix mr6(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr6(i,j)=r6[i];
      }else mr6(i,j)=999;
    }
  }
  return mr6;
}


// [[Rcpp::export]]
NumericMatrix mr7_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r7 = dat["r7"];
  NumericVector ron = dat["r_on"];
  int n = r7.length();
  int m = thres.length();
  NumericMatrix mr7(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr7(i,j)=r7[i];
      }else mr7(i,j)=999;
    }
  }
  return mr7;
}

// [[Rcpp::export]]
NumericMatrix mr7_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r7 = dat["r7"];
  NumericVector ron = dat["r_on"];
  int n = r7.length();
  int m = thres.length();
  NumericMatrix mr7(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr7(i,j)=r7[i];
      }else mr7(i,j)=999;
    }
  }
  return mr7;
}

// [[Rcpp::export]]
NumericMatrix mr8_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r8 = dat["r8"];
  NumericVector ron = dat["r_on"];
  int n = r8.length();
  int m = thres.length();
  NumericMatrix mr8(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr8(i,j)=r8[i];
      }else mr8(i,j)=999;
    }
  }
  return mr8;
}

// [[Rcpp::export]]
NumericMatrix mr8_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r8 = dat["r8"];
  NumericVector ron = dat["r_on"];
  int n = r8.length();
  int m = thres.length();
  NumericMatrix mr8(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr8(i,j)=r8[i];
      }else mr8(i,j)=999;
    }
  }
  return mr8;
}

// [[Rcpp::export]]
NumericMatrix mr9_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r9 = dat["r9"];
  NumericVector ron = dat["r_on"];
  int n = r9.length();
  int m = thres.length();
  NumericMatrix mr9(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr9(i,j)=r9[i];
      }else mr9(i,j)=999;
    }
  }
  return mr9;
}

// [[Rcpp::export]]
NumericMatrix mr9_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r9 = dat["r9"];
  NumericVector ron = dat["r_on"];
  int n = r9.length();
  int m = thres.length();
  NumericMatrix mr9(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr9(i,j)=r9[i];
      }else mr9(i,j)=999;
    }
  }
  return mr9;
}

// [[Rcpp::export]]
NumericMatrix mr10_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r10 = dat["r10"];
  NumericVector ron = dat["r_on"];
  int n = r10.length();
  int m = thres.length();
  NumericMatrix mr10(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr10(i,j)=r10[i];
      }else mr10(i,j)=999;
    }
  }
  return mr10;
}

// [[Rcpp::export]]
NumericMatrix mr10_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r10 = dat["r10"];
  NumericVector ron = dat["r_on"];
  int n = r10.length();
  int m = thres.length();
  NumericMatrix mr10(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr10(i,j)=r10[i];
      }else mr10(i,j)=999;
    }
  }
  return mr10;
}

// [[Rcpp::export]]
NumericMatrix mr11_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r11 = dat["r11"];
  NumericVector ron = dat["r_on"];
  int n = r11.length();
  int m = thres.length();
  NumericMatrix mr11(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr11(i,j)=r11[i];
      }else mr11(i,j)=999;
    }
  }
  return mr11;
}

// [[Rcpp::export]]
NumericMatrix mr11_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r11 = dat["r11"];
  NumericVector ron = dat["r_on"];
  int n = r11.length();
  int m = thres.length();
  NumericMatrix mr11(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr11(i,j)=r11[i];
      }else mr11(i,j)=999;
    }
  }
  return mr11;
}

// [[Rcpp::export]]
NumericMatrix mr12_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r12 = dat["r12"];
  NumericVector ron = dat["r_on"];
  int n = r12.length();
  int m = thres.length();
  NumericMatrix mr12(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr12(i,j)=r12[i];
      }else mr12(i,j)=999;
    }
  }
  return mr12;
}

// [[Rcpp::export]]
NumericMatrix mr12_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r12 = dat["r12"];
  NumericVector ron = dat["r_on"];
  int n = r12.length();
  int m = thres.length();
  NumericMatrix mr12(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr12(i,j)=r12[i];
      }else mr12(i,j)=999;
    }
  }
  return mr12;
}

// [[Rcpp::export]]
NumericMatrix mr13_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r13 = dat["r13"];
  NumericVector ron = dat["r_on"];
  int n = r13.length();
  int m = thres.length();
  NumericMatrix mr13(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr13(i,j)=r13[i];
      }else mr13(i,j)=999;
    }
  }
  return mr13;
}

// [[Rcpp::export]]
NumericMatrix mr13_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r13 = dat["r13"];
  NumericVector ron = dat["r_on"];
  int n = r13.length();
  int m = thres.length();
  NumericMatrix mr13(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr13(i,j)=r13[i];
      }else mr13(i,j)=999;
    }
  }
  return mr13;
}

// [[Rcpp::export]]
NumericMatrix mr_on_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r_on = dat["r_on"];
  NumericVector ron = dat["r_on"];
  int n = r_on.length();
  int m = thres.length();
  NumericMatrix mr_on(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr_on(i,j)=r_on[i];
      }else mr_on(i,j)=999;
    }
  }
  return mr_on;
}

// [[Rcpp::export]]
NumericMatrix mr_on_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r_on = dat["r_on"];
  NumericVector ron = dat["r_on"];
  int n = r_on.length();
  int m = thres.length();
  NumericMatrix mr_on(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr_on(i,j)=r_on[i];
      }else mr_on(i,j)=999;
    }
  }
  return mr_on;
}

// [[Rcpp::export]]
NumericMatrix mr_onfh_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r_onfh = dat["r_onfh"];
  NumericVector ron = dat["r_on"];
  int n = r_onfh.length();
  int m = thres.length();
  NumericMatrix mr_onfh(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr_onfh(i,j)=r_onfh[i];
      }else mr_onfh(i,j)=999;
    }
  }
  return mr_onfh;
}

// [[Rcpp::export]]
NumericMatrix mr_onfh_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r_onfh = dat["r_onfh"];
  NumericVector ron = dat["r_on"];
  int n = r_onfh.length();
  int m = thres.length();
  NumericMatrix mr_onfh(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr_onfh(i,j)=r_onfh[i];
      }else mr_onfh(i,j)=999;
    }
  }
  return mr_onfh;
}
// [[Rcpp::export]]
NumericMatrix mr13_lag_thresholdL(DataFrame dat, NumericVector thres){
  NumericVector r13_lag = dat["r13_lag"];
  NumericVector ron = dat["r_on"];
  int n = r13_lag.length();
  int m = thres.length();
  NumericMatrix mr13_lag(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]<thres[j]){
        mr13_lag(i,j)=r13_lag[i];
      }else mr13_lag(i,j)=999;
    }
  }
  return mr13_lag;
}

// [[Rcpp::export]]
NumericMatrix mr13_lag_thresholdGeq(DataFrame dat, NumericVector thres){
  NumericVector r13_lag = dat["r13_lag"];
  NumericVector ron = dat["r_on"];
  int n = r13_lag.length();
  int m = thres.length();
  NumericMatrix mr13_lag(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(ron[i]>=thres[j]){
        mr13_lag(i,j)=r13_lag[i];
      }else mr13_lag(i,j)=999;
    }
  }
  return mr13_lag;
}

//threshold for volatility return
// [[Rcpp::export]]
NumericMatrix mr1_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r1 = dat["r1"];
  NumericVector rvolatility = dat["volatility"];
  int n = r1.length();
  int m = thres.length();
  NumericMatrix mr1(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr1(i,j)=r1[i];
      }else mr1(i,j)=999;
    }
  }
  return mr1;
}

// [[Rcpp::export]]
NumericMatrix mr1_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r1 = dat["r1"];
  NumericVector rvolatility = dat["volatility"];
  int n = r1.length();
  int m = thres.length();
  NumericMatrix mr1(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr1(i,j)=r1[i];
      }else mr1(i,j)=999;
    }
  }
  return mr1;
}

// [[Rcpp::export]]
NumericMatrix mr2_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r2 = dat["r2"];
  NumericVector rvolatility = dat["volatility"];
  int n = r2.length();
  int m = thres.length();
  NumericMatrix mr2(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr2(i,j)=r2[i];
      }else mr2(i,j)=999;
    }
  }
  return mr2;
}

// [[Rcpp::export]]
NumericMatrix mr2_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r2 = dat["r2"];
  NumericVector rvolatility = dat["volatility"];
  int n = r2.length();
  int m = thres.length();
  NumericMatrix mr2(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr2(i,j)=r2[i];
      }else mr2(i,j)=999;
    }
  }
  return mr2;
}

// [[Rcpp::export]]
NumericMatrix mr3_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r3 = dat["r3"];
  NumericVector rvolatility = dat["volatility"];
  int n = r3.length();
  int m = thres.length();
  NumericMatrix mr3(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr3(i,j)=r3[i];
      }else mr3(i,j)=999;
    }
  }
  return mr3;
}

// [[Rcpp::export]]
NumericMatrix mr3_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r3 = dat["r3"];
  NumericVector rvolatility = dat["volatility"];
  int n = r3.length();
  int m = thres.length();
  NumericMatrix mr3(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr3(i,j)=r3[i];
      }else mr3(i,j)=999;
    }
  }
  return mr3;
}

// [[Rcpp::export]]
NumericMatrix mr4_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r4 = dat["r4"];
  NumericVector rvolatility = dat["volatility"];
  int n = r4.length();
  int m = thres.length();
  NumericMatrix mr4(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr4(i,j)=r4[i];
      }else mr4(i,j)=999;
    }
  }
  return mr4;
}

// [[Rcpp::export]]
NumericMatrix mr4_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r4 = dat["r4"];
  NumericVector rvolatility = dat["volatility"];
  int n = r4.length();
  int m = thres.length();
  NumericMatrix mr4(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr4(i,j)=r4[i];
      }else mr4(i,j)=999;
    }
  }
  return mr4;
}

// [[Rcpp::export]]
NumericMatrix mr5_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r5 = dat["r5"];
  NumericVector rvolatility = dat["volatility"];
  int n = r5.length();
  int m = thres.length();
  NumericMatrix mr5(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr5(i,j)=r5[i];
      }else mr5(i,j)=999;
    }
  }
  return mr5;
}

// [[Rcpp::export]]
NumericMatrix mr5_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r5 = dat["r5"];
  NumericVector rvolatility = dat["volatility"];
  int n = r5.length();
  int m = thres.length();
  NumericMatrix mr5(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr5(i,j)=r5[i];
      }else mr5(i,j)=999;
    }
  }
  return mr5;
}

// [[Rcpp::export]]
NumericMatrix mr6_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r6 = dat["r6"];
  NumericVector rvolatility = dat["volatility"];
  int n = r6.length();
  int m = thres.length();
  NumericMatrix mr6(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr6(i,j)=r6[i];
      }else mr6(i,j)=999;
    }
  }
  return mr6;
}

// [[Rcpp::export]]
NumericMatrix mr6_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r6 = dat["r6"];
  NumericVector rvolatility = dat["volatility"];
  int n = r6.length();
  int m = thres.length();
  NumericMatrix mr6(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr6(i,j)=r6[i];
      }else mr6(i,j)=999;
    }
  }
  return mr6;
}


// [[Rcpp::export]]
NumericMatrix mr7_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r7 = dat["r7"];
  NumericVector rvolatility = dat["volatility"];
  int n = r7.length();
  int m = thres.length();
  NumericMatrix mr7(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr7(i,j)=r7[i];
      }else mr7(i,j)=999;
    }
  }
  return mr7;
}

// [[Rcpp::export]]
NumericMatrix mr7_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r7 = dat["r7"];
  NumericVector rvolatility = dat["volatility"];
  int n = r7.length();
  int m = thres.length();
  NumericMatrix mr7(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr7(i,j)=r7[i];
      }else mr7(i,j)=999;
    }
  }
  return mr7;
}

// [[Rcpp::export]]
NumericMatrix mr8_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r8 = dat["r8"];
  NumericVector rvolatility = dat["volatility"];
  int n = r8.length();
  int m = thres.length();
  NumericMatrix mr8(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr8(i,j)=r8[i];
      }else mr8(i,j)=999;
    }
  }
  return mr8;
}

// [[Rcpp::export]]
NumericMatrix mr8_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r8 = dat["r8"];
  NumericVector rvolatility = dat["volatility"];
  int n = r8.length();
  int m = thres.length();
  NumericMatrix mr8(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr8(i,j)=r8[i];
      }else mr8(i,j)=999;
    }
  }
  return mr8;
}

// [[Rcpp::export]]
NumericMatrix mr9_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r9 = dat["r9"];
  NumericVector rvolatility = dat["volatility"];
  int n = r9.length();
  int m = thres.length();
  NumericMatrix mr9(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr9(i,j)=r9[i];
      }else mr9(i,j)=999;
    }
  }
  return mr9;
}

// [[Rcpp::export]]
NumericMatrix mr9_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r9 = dat["r9"];
  NumericVector rvolatility = dat["volatility"];
  int n = r9.length();
  int m = thres.length();
  NumericMatrix mr9(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr9(i,j)=r9[i];
      }else mr9(i,j)=999;
    }
  }
  return mr9;
}

// [[Rcpp::export]]
NumericMatrix mr10_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r10 = dat["r10"];
  NumericVector rvolatility = dat["volatility"];
  int n = r10.length();
  int m = thres.length();
  NumericMatrix mr10(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr10(i,j)=r10[i];
      }else mr10(i,j)=999;
    }
  }
  return mr10;
}

// [[Rcpp::export]]
NumericMatrix mr10_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r10 = dat["r10"];
  NumericVector rvolatility = dat["volatility"];
  int n = r10.length();
  int m = thres.length();
  NumericMatrix mr10(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr10(i,j)=r10[i];
      }else mr10(i,j)=999;
    }
  }
  return mr10;
}

// [[Rcpp::export]]
NumericMatrix mr11_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r11 = dat["r11"];
  NumericVector rvolatility = dat["volatility"];
  int n = r11.length();
  int m = thres.length();
  NumericMatrix mr11(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr11(i,j)=r11[i];
      }else mr11(i,j)=999;
    }
  }
  return mr11;
}

// [[Rcpp::export]]
NumericMatrix mr11_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r11 = dat["r11"];
  NumericVector rvolatility = dat["volatility"];
  int n = r11.length();
  int m = thres.length();
  NumericMatrix mr11(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr11(i,j)=r11[i];
      }else mr11(i,j)=999;
    }
  }
  return mr11;
}

// [[Rcpp::export]]
NumericMatrix mr12_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r12 = dat["r12"];
  NumericVector rvolatility = dat["volatility"];
  int n = r12.length();
  int m = thres.length();
  NumericMatrix mr12(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr12(i,j)=r12[i];
      }else mr12(i,j)=999;
    }
  }
  return mr12;
}

// [[Rcpp::export]]
NumericMatrix mr12_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r12 = dat["r12"];
  NumericVector rvolatility = dat["volatility"];
  int n = r12.length();
  int m = thres.length();
  NumericMatrix mr12(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr12(i,j)=r12[i];
      }else mr12(i,j)=999;
    }
  }
  return mr12;
}

// [[Rcpp::export]]
NumericMatrix mr13_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r13 = dat["r13"];
  NumericVector rvolatility = dat["volatility"];
  int n = r13.length();
  int m = thres.length();
  NumericMatrix mr13(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr13(i,j)=r13[i];
      }else mr13(i,j)=999;
    }
  }
  return mr13;
}

// [[Rcpp::export]]
NumericMatrix mr13_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r13 = dat["r13"];
  NumericVector rvolatility = dat["volatility"];
  int n = r13.length();
  int m = thres.length();
  NumericMatrix mr13(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr13(i,j)=r13[i];
      }else mr13(i,j)=999;
    }
  }
  return mr13;
}

// [[Rcpp::export]]
NumericMatrix mr_on_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector ron = dat["r_on"];
  NumericVector rvolatility = dat["volatility"];
  int n = ron.length();
  int m = thres.length();
  NumericMatrix mon(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mon(i,j)=ron[i];
      }else mon(i,j)=999;
    }
  }
  return mon;
}

// [[Rcpp::export]]
NumericMatrix mr_on_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector ron = dat["r_on"];
  NumericVector rvolatility = dat["volatility"];
  int n = ron.length();
  int m = thres.length();
  NumericMatrix mon(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mon(i,j)=ron[i];
      }else mon(i,j)=999;
    }
  }
  return mon;
}

// [[Rcpp::export]]
NumericMatrix mr_onfh_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector mronfh = dat["r_onfh"];
  NumericVector rvolatility = dat["volatility"];
  int n = mronfh.length();
  int m = thres.length();
  NumericMatrix monfh(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        monfh(i,j)=mronfh[i];
      }else monfh(i,j)=999;
    }
  }
  return monfh;
}

// [[Rcpp::export]]
NumericMatrix monfh_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector onfh = dat["onfh"];
  NumericVector rvolatility = dat["volatility"];
  int n = onfh.length();
  int m = thres.length();
  NumericMatrix monfh(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        monfh(i,j)=onfh[i];
      }else monfh(i,j)=999;
    }
  }
  return monfh;
}
// [[Rcpp::export]]
NumericMatrix mr13_lag_thresVolaL(DataFrame dat, NumericVector thres){
  NumericVector r13_lag = dat["r13_lag"];
  NumericVector rvolatility = dat["volatility"];
  int n = r13_lag.length();
  int m = thres.length();
  NumericMatrix mr13_lag(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]<thres[j]){
        mr13_lag(i,j)=r13_lag[i];
      }else mr13_lag(i,j)=999;
    }
  }
  return mr13_lag;
}

// [[Rcpp::export]]
NumericMatrix mr13_lag_thresVolaGeq(DataFrame dat, NumericVector thres){
  NumericVector r13_lag = dat["r13_lag"];
  NumericVector rvolatility = dat["volatility"];
  int n = r13_lag.length();
  int m = thres.length();
  NumericMatrix mr13_lag(n,m);
  for(int i=0;i<n;i++){
    for(int j=0;j<m;j++){
      if(rvolatility[i]>=thres[j]){
        mr13_lag(i,j)=r13_lag[i];
      }else mr13_lag(i,j)=999;
    }
  }
  return mr13_lag;
}


