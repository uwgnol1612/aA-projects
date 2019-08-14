class View {
    constructor(game, $el) {
        this.game = game;
        this.$el = $el;
        this.setupTowers();
        this.render();
    }

    setupTowers() {
        for (let i = 0; i < 3; i++) {
            const $ul = $('<ul>')
            $ul.addClass(`tower-${i}`)
            this.$el.append($ul);

        }
        for (let j = 0; j < 3; j++) {
            const $uls = $("ul");
            const $startTower = $($uls[0]);
            const $li = $("<li>");
            $li.addClass(`disc-${j}`)
            $startTower.append($li)
        }
    }

    render() {

    }
    

    clickTower() {

    }

}


module.exports = View;