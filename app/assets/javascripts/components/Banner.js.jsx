class Banner extends React.Component {
  render() {
    return(
    <div className="row">
      <div className="col-xs-9 pl-0 pr-0">
        <Carousel></Carousel>
      </div>
      <div className="col-xs-3">
        <OwlCarousel></OwlCarousel>
        <InfoBoxIcon></InfoBoxIcon>
      </div>
    </div>
    )
  }
}
