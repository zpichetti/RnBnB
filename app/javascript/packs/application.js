/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

// TypedJS pour la home
import { loadDynamicBannerText } from '../components/banner';

if (document.getElementById("banner-typed-text")) {
  loadDynamicBannerText();
}

// Sweetalert pour activer ou désactiver la performance
import { initSweetalert } from '../components/init_sweetalert';

initSweetalert('#sweet-alert-disable', {
  title: "Are you sure?",
  text: "Your performance can not be booked !",
  icon: "warning",
  }, (value) => {
    if (value) {
      const link = document.querySelector('#toggle-link');
      link.click();
    }
});

initSweetalert('#sweet-alert-enable', {
  title: "Are you sure?",
  text: "Your performance can be booked !",
  icon: "warning",
  }, (value) => {
    if (value) {
      const link = document.querySelector('#toggle-link');
      link.click();
    }
});

// animation des cards
import AOS from 'aos';
import 'aos/dist/aos.css';
AOS.init();