class Items extends React.Component {
  render() {
    const play = "play now"
    return(
      <div className="col-xs-4 pb-1">
        <div className="view overlay">
          <img src="assets/bh2.jpg" />
          <div className="mask flex-center rgba-cyan-strong">
            <p className="white-text font-weight-bold play"><i className="fa fa-play" /></p>
          </div>
        </div>
        <div className="m-0">
          <h4 className="mb-0">
            <a href="#" className="black-text">Today i miss you</a>
          </h4>
          <small>
            <a href="#">Taylor Swift</a>
          </small>
        </div>
      </div>
    )
  }
}
