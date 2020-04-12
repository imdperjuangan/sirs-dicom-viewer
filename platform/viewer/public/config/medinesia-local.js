const config = {
  // default: '/'
  routerBasename: '/',
  whiteLabelling: {},
  extensions: [],
  showStudyList: true,
  filterQueryParam: false,
  oss: {
    region: 'oss-ap-southeast-5',
    accessKeyId: 'LTAI4Fn7wdpprMTKba8B6Xxx',
    accessKeySecret: 'AbIkPcOZ2udyOgNQIlaODCggWAnSkY',
    bucket: 'sirs-dev'
  },
  servers: {
    dicomWeb: [
      {
        name: 'Medinesia',
        wadoUriRoot: 'https://api.staging.medinesia.id/dicom/wado',
        qidoRoot: 'https://api.staging.medinesia.id/dicom/rs',
        wadoRoot: 'https://api.staging.medinesia.id/dicom/rs',
        qidoSupportsIncludeField: true,
        imageRendering: 'wadors',
        thumbnailRendering: 'wadors',
        enableStudyLazyLoad: true
      }
    ]
  }
}

window.config = config
