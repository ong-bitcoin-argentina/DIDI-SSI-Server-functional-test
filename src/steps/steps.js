const {Given, When, Then, AfterAll, After} = require('cucumber');
const assert = require('assert').strict
const restHelper = require('../util/restHelper');

Given('A account {}', function (request) {
    this.context['request'] = JSON.parse(request);
});

Given('A account', function () {
});

Given('A token {}', function (request) {
    this.context['request'] = JSON.parse(request);
});

When('I send POST request to {}', async function (path) {
    this.context['response'] = await restHelper.postData(`${process.env.SERVICE_URL}${path}`, this.context['request']);
});

When('I send POST request to {} {}', async function (path, id) {
    this.context['response'] = await restHelper.postData(`${process.env.SERVICE_URL}${path + id}`, this.context['request']);
});

When('I send PATCH request to {}', async function (path) {
    this.context['response'] = await restHelper.postData(`${process.env.SERVICE_URL}${path}`, this.context['request']);
});

When('I send DELETE request to {} {}', async function (path,param) {
    this.context['response'] = await restHelper.postData(`${process.env.SERVICE_URL}${path + param}`);
});

When('I send GET request to {}', async function (path) {
    this.context['response'] = await restHelper.getData(`${process.env.SERVICE_URL}${path}`);
});

Then('I get response code {int}', async function (code) {
    assert.equal(this.context['response'].status, code);
});
