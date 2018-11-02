class ListMusic extends React.Component {
  render() {
    return(
      <div className="container-fluid">
        <div className="row">
          <div className="col-xs-9">
            <div className="row">
              <ListenTheMost></ListenTheMost>
              <SuggestSong></SuggestSong>
            </div>
          </div>
          <Ranking></Ranking>
        </div>
      </div>
    )
  }
}
