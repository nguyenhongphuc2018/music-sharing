class AlbumHot extends React.Component {
  render() {
    const album_hot = "Album hot"
    const time_line = "2 days ago"
    return(
      <div className="col-xs-9">
        <div className="timeline-item">
          <span className="time">
            <i className="fa fa-clock-o" />{time_line}</span>
          <div className="single-news mb-4">
            <h3 className="font-weight-bold dark-grey-text mb-3">
              <a>{album_hot}</a>
            </h3>
          </div>
          <div className="row">
            <Items></Items>
          </div>
        </div>
      </div>
    )
  }
}
