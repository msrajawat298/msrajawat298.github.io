const reviewsPerPage = 5;
let allReviews = [];
let currentPage = 0;

const fetchReviews = () => {
    const fileNames = ['google_reviews.json', 'linkedin_reviews.json'];
    const sourceUrls = {
        'google_reviews.json': 'https://maps.app.goo.gl/aH3ancyuQJ7hbWZW6',
        'linkedin_reviews.json': 'https://www.linkedin.com/in/msrajawat298/details/recommendations/?detailScreenTabIndex=0'
    };

    return Promise.all(fileNames.map(file =>
        fetch('./reviews/' + file)
            .then(res => res.json())
            .then(data => ({ sourceUrl: sourceUrls[file], reviews: data }))
    )).then(dataArray => {
        allReviews = dataArray.reduce((acc, { sourceUrl, reviews }) => {
            return acc.concat(reviews.map(r => ({ ...r, sourceUrl })));
        }, []);
    });
};

const renderReviews = (reviews) => {
const wrapper = document.getElementById('content');
reviews.forEach(review => {
    const div = document.createElement('div');
    div.classList.add('review');
    div.innerHTML = `
        <div class="reviewer">${review.reviewer.displayName}</div>
        <div class="comment">
            <span class="short-comment">${review.comment.split(' ').slice(0, 20).join(' ')}...</span>
            <span class="full-comment" style="display: none;">${review.comment}</span>
            ${review.comment.split(' ').length > 20 ? '<button class="read-more">Read More</button>' : ''}
        </div>
        <div class="source"><strong>Source : </strong>
            <a href="${review.sourceUrl}" target="_blank">
                ${review.sourceUrl.includes('linkedin') ? '<i class="fab fa-linkedin"></i>' : '<i class="fas fa-map-marker-alt"></i>'}
                ${review.sourceUrl.includes('linkedin') ? 'LinkedIn' : 'Google Reviews'}
            </a>
        </div>
    `;
    wrapper.appendChild(div);
});

// Add click event listener to "Read More" buttons
document.querySelectorAll('.read-more').forEach(button => {
    button.addEventListener('click', (e) => {
        const comment = e.target.closest('.comment');
        const shortComment = comment.querySelector('.short-comment');
        const fullComment = comment.querySelector('.full-comment');

        // Toggle visibility of comments
        shortComment.style.display = shortComment.style.display === 'none' ? '' : 'none';
        fullComment.style.display = fullComment.style.display === 'none' ? '' : 'none';

        // Toggle button text
        e.target.textContent = e.target.textContent === 'Read More' ? 'Read Less' : 'Read More';
    });
});
};

const loadMoreReviews = () => {
    const start = currentPage * reviewsPerPage;
    const end = start + reviewsPerPage;
    const reviews = allReviews.slice(start, end);
    renderReviews(reviews);
    currentPage++;
    if (currentPage * reviewsPerPage >= allReviews.length) {
        document.getElementById('loader').style.display = 'none';
    }
};

document.addEventListener('DOMContentLoaded', () => {
    fetchReviews().then(() => {
        loadMoreReviews();
        document.getElementById('sortOption').addEventListener('change', (e) => {
            const sortBy = e.target.value;
            if (sortBy === 'name') {
                allReviews.sort((a, b) => a.reviewer.displayName.localeCompare(b.reviewer.displayName));
            } else if (sortBy === 'date') {
                allReviews.sort((a, b) => new Date(b.date) - new Date(a.date));
            }
            document.getElementById('content').innerHTML = '';
            currentPage = 0;
            loadMoreReviews();
        });

        window.addEventListener('scroll', () => {
            if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 200) {
                loadMoreReviews();
            }
        });
    });
});