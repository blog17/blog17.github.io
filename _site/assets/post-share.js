/**
 * Populate per-post share links using current page URL/title.
 */
(function () {
    function initPostShareLinks() {
        const root = document.querySelector(".post-share");
        if (!root) return;

        const pageUrl = window.location.href;
        const pageTitle = document.title || "";
        const encodedUrl = encodeURIComponent(pageUrl);
        const encodedTitle = encodeURIComponent(pageTitle);

        const xLink = root.querySelector(".post-share-x");
        if (xLink) {
            xLink.href = `https://twitter.com/intent/tweet?url=${encodedUrl}&text=${encodedTitle}`;
            xLink.target = "_blank";
            xLink.rel = "noopener noreferrer";
        }

        const fbLink = root.querySelector(".post-share-facebook");
        if (fbLink) {
            fbLink.href = `https://www.facebook.com/sharer/sharer.php?u=${encodedUrl}`;
            fbLink.target = "_blank";
            fbLink.rel = "noopener noreferrer";
        }

        const mailLink = root.querySelector(".post-share-email");
        if (mailLink) {
            mailLink.href = `mailto:?subject=${encodedTitle}&body=${encodedUrl}`;
        }
    }

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", initPostShareLinks);
    } else {
        initPostShareLinks();
    }
})();
