class InfoBoxIcon extends React.Component {
  render() {
    const style = {
      width: '70%'
    };
    return(
      <div className="info-box" id="grad1">
        <span className="info-box-icon">
          <i className="fa fa-star"></i>
        </span>

        <div className="info-box-content" id="grad1">
          <span className="info-box-text">Caly Rae Jepson</span>
          <span className="info-box-number">Party For One</span>

          <div className="progress">
            <div className="progress-bar" style={style}></div>
          </div>
          <span className="progress-description">
            New Album
          </span>
        </div>
      </div>
    )
  }
}
