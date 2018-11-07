class Ranking extends React.Component {
  render() {
    return(
      <div className="col-xs-3">
        <h3 className="font-weight-bold dark-grey-text mb-3">
          <a>Ranking</a>
        </h3>
        <div className="nav-tabs-custom">
          <div className="tab-content">
            <RankTop></RankTop>
          </div>
        </div>
      </div>
    )
  }
}
