import ReactOnRails from 'react-on-rails';
import 'bootstrap/dist/css/bootstrap.css';
import App from '../bundles/TechTalk/components/App';
import Header from '../bundles/TechTalk/components/Header';
import Search from '../bundles/TechTalk/components/Search';

// This is how react_on_rails can see the App in the browser.
ReactOnRails.register({
  App, Header, Search
});
