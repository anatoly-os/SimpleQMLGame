var enemyComponent;
var enemyObject;
var curLevel = 1;
let maxLevel = 10;

function minMaxRand(min, max) {
    return min + Math.floor(Math.random() * (max - min));
}

function killEnemy() {
    if (enemyObject != null) {
        enemyObject.destroy();
        enemyObject = null;
    }
}

function createEnemy() {
    killEnemy();

    if (enemyComponent == null)
        enemyComponent = Qt.createComponent("enemy.qml");

    if (enemyComponent.status === Component.Ready) {
        var newEnemy = enemyComponent.createObject(gameScreen);
        if (newEnemy == null) {
            console.log("error creating enemy");
            return false;
        }

        newEnemy.width = Math.floor(minMaxRand(100, 300) / 10) * 10;
        newEnemy.height = newEnemy.width;

        newEnemy.x = gameScreen.width / 2 - newEnemy.width / 2;
        newEnemy.y = (gameScreen.height - leftButton.height / 2) / 2 - newEnemy.height / 2;

        newEnemy.enemySizeText = newEnemy.width;

        enemyObject = newEnemy;
    }
}

function changeLevel(newLevelVal) {
    curLevel = newLevelVal;
    levelRect.level = "Level: " + newLevelVal;
}

function startNewGame() {
    changeLevel(1);

    startGameButton.opacity = 0;
    startGameButton.enabled = false;

    createEnemy();

    leftButton.enabled = true;
    leftButton.color = "pink";
    rightButton.enabled = true;
    rightButton.color = "lightgreen";
}

function gameFinished() {
    startGameButton.opacity = 1;
    startGameButton.enabled = true;

    leftButton.enabled = false;
    leftButton.color = "lightgrey";
    rightButton.enabled = false;
    rightButton.color = "lightgrey";
}

function damageEnemy (damage) {
    enemyObject.width -= damage
    enemyObject.height = enemyObject.width;
    enemyObject.x += damage / 2;
    enemyObject.y += damage / 2;
    enemyObject.enemySizeText = enemyObject.width;
    if (enemyObject.width < 30) {
        killEnemy();
        curLevel += 1;
        changeLevel(curLevel);

        if (curLevel < maxLevel) {
            createEnemy();
        } else {
            gameFinished();
        }
    }
}

function leftDamage() {
    let damage = minMaxRand(leftButton.damageMin, leftButton.damageMax) * curLevel;
    damageEnemy(damage);
}

function rightDamage() {
    let damage = minMaxRand(rightButton.damageMin, rightButton.damageMax) * curLevel;
    damageEnemy(damage);
}
