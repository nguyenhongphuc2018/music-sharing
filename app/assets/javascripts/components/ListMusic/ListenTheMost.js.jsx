class ListenTheMost extends React.Component {
  render() {
    const listen_the_most = "Nghe nhiều nhất"
    return(
      <div className="col-lg-6 col-md-12">
        <div className="single-news mb-4">
          <h3 className="font-weight-bold dark-grey-text mb-3">
            <a>{listen_the_most}</a>
          </h3>
        </div>
        <ListSong></ListSong>
      </div>
    )
  }
}
