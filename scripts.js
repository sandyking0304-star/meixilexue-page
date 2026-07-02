const articlesList = document.getElementById("articlesList");
const searchInput = document.getElementById("searchInput");

function formatMeta(article) {
  return `<span class="tag-pill">${article.category}</span><span>${article.date}</span>`;
}

function renderArticles(items) {
  articlesList.innerHTML = items.map((article) => `
      <article class="article-card">
        <div class="article-cover">
          <img src="${article.cover || 'https://via.placeholder.com/900x500?text=封面图'}" alt="${article.title}" />
        </div>
        <div class="article-card-body">
          <h3>${article.title}</h3>
          <p>${article.description}</p>
          <div class="article-meta">${formatMeta(article)}</div>
          <a class="article-link" href="${article.url}" target="_blank" rel="noopener noreferrer">阅读原文</a>
        </div>
      </article>
    `).join("");
}

function filterArticles(query) {
  const normalized = query.trim().toLowerCase();
  if (!normalized) return articles;
  return articles.filter((article) => {
    return [article.title, article.description, article.category]
      .some((text) => text.toLowerCase().includes(normalized));
  });
}

searchInput.addEventListener("input", (event) => {
  renderArticles(filterArticles(event.target.value));
});

renderArticles(articles);
