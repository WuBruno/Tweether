import React from 'react'
import Link from "next/link"

import { Center } from "./Layout"
import Nav from "./Nav"
import Modal from "./Modal"
import TweetComposer from "./TweetComposer"

import logotype from "../icons/logotype.svg"
import { getLoggedInUserId, getUserInfo } from '../web3/user'

export default class Header extends React.Component {
  state = {
    loggedIn: false,
    userInfo: {},
    showComposeModal: false,
  }

  toggleComposeModal = () => {
    const { showComposeModal } = this.state

    this.setState({
      showComposeModal: !showComposeModal,
    })
  }

  async componentDidMount() {
    const userId = await getLoggedInUserId()

    console.log(userId);

    try {
      const userInfo = await getUserInfo(userId)

      this.setState({
        loggedIn: true,
        userInfo,
      })
    } catch (err) {
      console.error("Couldn't find logged in user", err)
    }
  }

  render() {
    return (
      <header>
        <Center>
          <Link href="/">
            <a className="logotype">
              <img src={logotype} />
            </a>
          </Link>

          {this.state.loggedIn && (
            <Nav
              userInfo={this.state.userInfo}
              toggleComposeModal={this.toggleComposeModal}
            />
          )}
        </Center>

        {this.state.showComposeModal && (
          <Modal
            onClose={this.toggleComposeModal}
          >
            <TweetComposer onClose={this.toggleComposeModal} />
          </Modal>
        )}

        <nav>

        </nav>

        <style jsx>{`
          header {
            background-color: #FFFFFF;
            box-shadow: 0 1px 3px 0 rgba(0,0,0,0.14);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 100;
          }
        `}</style>
      </header>
    )
  }
}