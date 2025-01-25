require("./bootstrap");

import { createApp, h } from "vue";
import { createInertiaApp, Link, Head } from "@inertiajs/vue3";

import './../css/app.css';

createInertiaApp({
    resolve: (name) => require(`./Pages/${name}`),
    setup({ el, App, props }) {

        createApp({ render: () => h(App, props) })
            .component("Link", Link)
            .component("Head", Head)
            .mount(el);
    },
});

window.$ = window.jQuery = require("jquery");

require('./bootstrap');