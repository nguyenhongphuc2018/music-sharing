class CategoryHot extends React.Component {
  render() {
    const category_hot = "Category Hot"
    return(
      <div className="col-xs-3">
        <ul className="p-0 m-0" id="category">
          <li>
            <div className="single-news mb-4 border-bot-0">
              <h3 className="text-center dark-grey-text mb-3">
                <a>{category_hot}</a>
              </h3>
            </div>
          </li>
          <li><img src="https://avatar-nct.nixcdn.com/topic/thumb/2018/11/01/a/c/7/2/1541048394009_org.jpg" /></li>
          <li><img src="https://avatar-nct.nixcdn.com/topic/thumb/2018/11/01/a/c/7/2/1541056007273_org.jpg" /></li>
          <li><img src="https://avatar-nct.nixcdn.com/topic/thumb/2018/11/01/a/c/7/2/1541053961888_org.jpg" /></li>
          <li><img src="https://avatar-nct.nixcdn.com/topic/thumb/2018/11/01/a/c/7/2/1541045857681_org.jpg" /></li>
        </ul>
      </div>
    )
  }
}
