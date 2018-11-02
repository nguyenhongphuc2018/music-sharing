class SuggestSong extends React.Component {
  render() {
    const suggest_song = "Gợi ý cho bạn"
    return(
      <div className="col-lg-6 col-md-12">
        <div className="single-news mb-4">
          <h3 className="font-weight-bold dark-grey-text mb-3">
            <a>{suggest_song}</a>
          </h3>
        </div>
        <ListSong></ListSong>
      </div>
    )
  }
}
