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

