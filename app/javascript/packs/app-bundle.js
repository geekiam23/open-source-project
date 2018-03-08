import ReactOnRails from 'react-on-rails';
import 'bootstrap/dist/css/bootstrap.css';
import App from '../bundles/TechTalk/components/App';
import Header from '../bundles/TechTalk/components/Header';
import Search from '../bundles/TechTalk/components/Search';
import TextPost from '../bundles/TechTalk/components/TextPost';
import PostModal from '../bundles/TechTalk/components/PostModal';
import PicPost from '../bundles/TechTalk/components/PicPost';
import MeetingPost from '../bundles/TechTalk/components/MeetingPost';
import PostCard from '../bundles/TechTalk/components/PostCard';

// This is how react_on_rails can see the App in the browser.
ReactOnRails.register({
  Header, Search, TextPost, PostModal, PicPost, MeetingPost, PostCard
});
