#!/bin/bash
sudo curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

sh -c "$(curl -sSfL https://release.solana.com/v1.16.12/install)"

source $HOME/.cargo/env

export PATH="/home/ubuntu/.local/share/solana/install/active_release/bin:$PATH"
sudo npm install -g mocha
sudo npm install -g typescript ts-node

cargo install --git https://github.com/coral-xyz/anchor avm --locked --force

avm install latest && avm use latest

solana --version
solana config set --url localhost
solana config get
