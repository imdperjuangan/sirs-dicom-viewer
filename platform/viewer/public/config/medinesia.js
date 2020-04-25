const config = {
  // default: '/'
  routerBasename: '/',
  whiteLabelling: {},
  extensions: [],
  showStudyList: false,
  filterQueryParam: false,
  servers: {
    dicomWeb: [
      {
        name: 'Thorax Covid',
        qidoSupportsIncludeField: true,
        imageRendering: 'wadors',
        thumbnailRendering: 'wadors',
        enableStudyLazyLoad: true
      }
    ]
  }
}

window.config = config
