class Items extends React.Component {
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
    fetch("http://localhost:3000/songs")
    .then(response => response.json())
    .then(data => this.setState({
      data
    }))
    .catch(err => console.log("fails: " + err))
  }


  render() {
    const {data} = this.state
    const single_song = data.map(song =>{
     return <SingleSong song={song} key={song.id}></SingleSong>
    })
    return(
      <div className="row">
        {single_song}  
      </div>
    )
  }
}
