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
      ]
    }
  }
  render() {
    const list_chart_music = this.state.rank.map((rank) =>
      <div className="info-box hoverable" key={rank.location}>
        <span className={"info-box-icon blue-gradient-" + rank.background.toString()}>
          {rank.location}
        </span>
        <RankItems></RankItems>
      </div>
    )
    return(
      <div className="tab-pane active" id="tab_1">
        {list_chart_music}
      </div>
    )
  }
}
