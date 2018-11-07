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
          <li><img src="assets/category_1.jpg" /></li>
          <li><img src="assets/category_2.jpg" /></li>
          <li><img src="assets/category_3.jpg" /></li>
          <li><img src="assets/category_4.jpg" /></li>
        </ul>
      </div>
    )
  }
}
