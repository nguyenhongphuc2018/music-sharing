class Song extends React.Component {
  render() {
    return(
      <div className="row">
        <div className="col-md-3">
          <div className="view overlay rounded z-depth-1 mb-lg-0 mb-4">
            <img src="/assets/bh1-db59dd0777aecf7c65764a944ba8f2985bb74bcab6c4b51e2f283885838246ae.jpg" className="img-fluid" />
            <a><div className="mask rgba-white-slight waves-effect waves-light"></div></a>
          </div>
        </div>
        <div className="col-md-9">
          <p className="font-weight-bold dark-grey-text">Cất anh vào quá khứ</p>
          <div className="d-flex justify-content-between">
            <div className="col-11 text-truncate pl-0 mb-lg-0 mb-3">
              <a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
                aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</a>
            </div>
            <a href="">
              <i className="fa fa-play-circle-o fa-fw"></i>
            </a>
          </div>
          <a href="#!" className="dark-grey-text">John cena</a>
        </div>
      </div>
    )
  }
}
