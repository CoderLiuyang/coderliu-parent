import request from '@/router/axios'

export function fetchList(query) {
  return request({
    url: '/${moduleName}/${entityPath}/page',
    method: 'get',
    params: query
  })
}

export function addObj(obj) {
  return request({
    url: '/${moduleName}/${entityPath}',
    method: 'post',
    data: obj
  })
}

export function getObj(id) {
  return request({
    url: '/${moduleName}/${entityPath}/' + id,
    method: 'get'
  })
}

export function delObj(id) {
  return request({
    url: '/${moduleName}/${entityPath}/' + id,
    method: 'delete'
  })
}

export function putObj(obj) {
  return request({
    url: '/${moduleName}/${entityPath}',
    method: 'put',
    data: obj
  })
}
