import React from 'react';
import { connect } from 'react-redux';
import SessionForm from './session_form/session_form';
import UserShow from './user_profile/user_show';

import {
  StyleSheet,
  Text,
  View,
  StatusBar,
  TextInput,
  Button
} from 'react-native';

class Artis extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      user_id: 1
    };
    this._onSubmit = this._onSubmit.bind(this);
  }

  _onSubmit() {

  }

  render() {
    return (
      <View style={styles.container}>
        <UserShow />
      </View>
    );
  }

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
  },
});

var mapStateToProps = (state) => {
  return {
  };
};

var mapDispatchToProps = dispatch => {
  return {
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(Artis);
