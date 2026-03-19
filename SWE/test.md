```
@accounting
@containers
void rebalance_portfolio ( portfolio p modifiable ) {
    for ( holding in p.assets ) {
       if( holding.ticker in ["AAPL","GOOGL"]){
            print("Checking stock ", holding.ticker);
       }
    }
}
main(){
  user Me = user("John","john@finex.com");
  account myAccount = account(Me,100000.0);
  portfolio myPortfolio = portfolio(myAccount,[
  asset.stock("AAPL",50,175.0),
  asset.stock("GOOGL",30,2800.0)]);
  rebalance_portfolio(myPortfolio);
  print("Final Portfolio Value: ", myPortfolio.curr_value());
  return 0;
}
```