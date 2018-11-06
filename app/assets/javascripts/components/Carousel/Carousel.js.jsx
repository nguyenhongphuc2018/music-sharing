class Carousel extends React.Component {
  render() {
    return(
      <div id="carousel-example-generic" className="carousel slide" data-ride="carousel">
      <div className="carousel-inner">
        <div className="item active">
          <img src="https://avatar-nct.nixcdn.com/slideshow/2018/11/01/9/e/6/4/1541052641397_org.jpg" className="item height-40" />
          <div className="carousel-caption">
          </div>
        </div>
        <div className="item">
          <img src="https://avatar-nct.nixcdn.com/slideshow/2018/10/31/8/c/2/1/1540974220884_org.jpg" className="item height-40" />
          <div className="carousel-caption">
          </div>
        </div>
      </div>
      <a className="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span className="fa fa-angle-left"></span>
      </a>
      <a className="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span className="fa fa-angle-right"></span>
      </a>
    </div>
    )
  }
}
