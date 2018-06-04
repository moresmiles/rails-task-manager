$(function () {
  $('#showGroups').click(getGroups)
});

  class Group {
    constructor(name, id){
      this.name = name;
      this.id = id;
    }
    renderGroup() {
      return `<a href="http://localhost:3000/groups/${this.id}"><h5>${this.name}</h5></a>`;
    }
  }

  function getGroups(){
  $.getJSON('http://localhost:3000/groups', function(data){
    data.forEach(group => {
      let createdGroup = new Group(group.name, group.id)
      $('#groupsList').append(createdGroup.renderGroup())
    })
  })
};
