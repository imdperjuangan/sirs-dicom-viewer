const config = {
  // default: '/'
  routerBasename: '/',
  whiteLabelling: {},
  extensions: [],
  showStudyList: true,
  filterQueryParam: false,
  oss: {
    region: '<OSS_REGION>',
    accessKeyId: '<OSS_ACCESS_KEY_ID>',
    accessKeySecret: '<OSS_ACCESS_KEY_SECRET>',
    bucket: '<OSS_BUCKET>'
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
