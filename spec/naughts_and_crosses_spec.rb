require_relative '../lib/naughts_and_crosses.rb'


describe Game do
  let(:player1) { instance_double('player1')}
  let(:player2) { instance_double('player2')}
  subject(:game) { described_class.new(player1, player2) }

  describe '#user1_turn' do

    it 'changes empty space to X' do
      input = 3
      game.@three = ' '
      expect{game.user1_turn(3)}.to change{ instance_variable_get(game.three) }.from(' ').to('X')
      
    end


  end

end