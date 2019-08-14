class View {
  constructor(game, $el) {

    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();

  }

  setupBoard() {
    const $ul = $("<ul>");
    $ul.addClass("board");
    

    for (let i = 0; i < 3; i++) {
      for (let j= 0; j < 3; j++) {
      const $li = $("<li>");

      $li.addClass("cell");
      $li.data("pos", [i, j]);
      $ul.append($li);
      }
    }
    this.$el.append($ul);
  }

  bindEvents() {
    this.$el.on("click", "li", (event) => {
      const $sq = $(event.currentTarget);
      this.makeMove($sq);
      });
  }

  makeMove($sq) {
    const pos = $sq.data("pos");
    const currentPlayer = this.game.currentPlayer;

    try {
      this.game.playMove(pos);
    } catch (e) {
      alert("This " + e.msg.toLowerCase());
      return;
    }

    $sq.text(currentPlayer);
    $sq.addClass("marked");

    if (this.game.isOver()) {
      this.$el.off("click");
      const winner = this.game.winner();

      if (winner) {
        alert(`Winner is ${winner}`)
      } else {
        alert("It's draw!")
      }
    }

  }


}

module.exports = View;
