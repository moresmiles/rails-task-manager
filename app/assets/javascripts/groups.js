$(function () {
  $('#showGroups').one('click', getGroups)
  $('#nextGroup').on('click', showNextGroup)
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

const getGroups = () => {
  $.getJSON('http://localhost:3000/groups', (data) => {
    data.forEach(group => {
      let createdGroup = new Group(group.name, group.id)
      $('#groupsList').append(createdGroup.renderGroup())
    })
  })
};
  //fetch('http://localhost:3000/groups')
  //  .then(function(res){
      //return res.json()
  //})
    //.then(function(data){
      //const createdGroup = new Group(data.name, data.id)
      //$('#groupsList').append(createdGroup.renderGroup())
  //})


function showNextGroup(event){
  event.preventDefault();

  $.getJSON(this.href, function(data){

    let name = data.name
    let users = data.users
    let lists = data.lists

    $('#groupName').html(name)

    $('#groupUsers li').remove();
    users.forEach(user => {
      $('#groupUsers').append(`<li class="list-group-item"> ${user.email} </li>`)
    })
    $('#groupLists li').remove();
    lists.forEach(list => {
      $('#groupLists').append(`<li class="list-group-item"><a href="/groups/${list.group_id}/lists/${list.id}"> ${list.name} </a></li>`)
    })
  })
}
