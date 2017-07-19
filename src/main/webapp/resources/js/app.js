var app = angular.module('plunker', ['angularBootstrapNavTree']);

app.controller('MainCtrl', function($scope) {
  $scope.name = 'piopio';

  var treedata_geography = [{
    label: '학적',
    children: ['Caracas', 'Maracaibo']
    },{
    label: '수업',
    children: ['Caracas', 'Maracaibo']
    },{
    label: '등록',
    children: ['Caracas', 'Maracaibo']
    },{
    label: '장학',
    children: ['Caracas', 'Maracaibo']
    },{
    label: '상담',
    children: ['Caracas', 'Maracaibo']
    }
  ];
  $scope.my_data = treedata_geography;

});