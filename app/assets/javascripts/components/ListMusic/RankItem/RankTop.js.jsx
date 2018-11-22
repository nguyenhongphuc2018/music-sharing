class RankTop extends React.Component {
  constructor(props){
    super(props);
    this.state ={
      rank: [
        {location:1 , background: "1"},
        {location:2 , background: "2"},
        {location:3 , background: "2"},
        {location:4 , background: "3"},
        {location:5 , background: "3"},
        {location:6 , background: "3"}
      ],
      data: []
    }
  }

  componentDidMount() {
    this.fetchData()
  }

  fetchData() {
    fetch("http://localhost:3000/songs/chart")
    .then(response => response.json())
    .then(data => this.setState({
      data
    }))
    .catch(err => console.log(err))
  }

  render() {
    let {data} = this.state
    let rank_items = data.map(item => {
      return  <RankItems item={item}></RankItems>
    })
    return(
      <div className="tab-pane active" id="tab_1">
        {rank_items}
      </div>
    )
  }
}
