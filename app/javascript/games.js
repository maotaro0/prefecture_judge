document.addEventListener("turbo:load", () => {
  const prefectureCards = document.querySelectorAll(".prefecture-card");
  const selectedInput = document.querySelector("#selected-prefecture-ids");
  const answerButton = document.querySelector(".answer-button");

  prefectureCards.forEach((card) => {
    card.addEventListener("click", () => {
      const selectedCards = document.querySelectorAll(".prefecture-card.selected");

      if (card.classList.contains("selected")) {
        card.classList.remove("selected");
      } else if (selectedCards.length < 3) {
        card.classList.add("selected");
      }

      updateSelectedPrefectures();
    });
  });

  function updateSelectedPrefectures() {
    const selectedCards = document.querySelectorAll(".prefecture-card.selected");

    const selectedIds = Array.from(selectedCards).map((card) => {
      return card.dataset.prefectureId;
    });

    selectedInput.value = selectedIds.join(",");
    answerButton.disabled = selectedIds.length !== 3;
  }
});