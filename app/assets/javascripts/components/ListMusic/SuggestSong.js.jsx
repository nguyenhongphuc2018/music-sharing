class SuggestSong extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      data: []
    }
    this.fetchData = this.fetchData.bind(this)
  }

  componentDidMount() {
    this.fetchData()
  }

  fetchData() {
    fetch("http://localhost:3000/songs/recommend")
    .then(response => response.json())
    .then(data => this.setState({
      data
    }))
    .catch(err => console.log("fails: " + err))
  }

  render() {
    const suggest_song = "Suggest Song"
    const {data} = this.state
    let list_song = data.map(song => {
      return <ListSong song={song} key={song.id}></ListSong>
    })
    return(
      <div className="col-lg-6 col-md-12">
        <div className="single-news mb-4">
          <h3 className="font-weight-bold dark-grey-text mb-3">
            <a>{suggest_song}</a>
          </h3>
        </div>
        {list_song}
      </div>
    )
  }
}
