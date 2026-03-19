(function() {
	var LANGUAGES = window.WIKI_LANGUAGES || [{ code: 'en', label: 'English', flag: '🇬🇧' }];

	function getCurrentLang() {
		var match = window.location.pathname.match(/\/([a-z]{2})\//);
		if (match && LANGUAGES.some(function(l) { return l.code === match[1]; })) {
			return match[1];
		}
		return 'en';
	}

	function switchLang(newLang) {
		var currentLang = getCurrentLang();
		var path = window.location.pathname;
		var newPath = path.replace('/' + currentLang + '/', '/' + newLang + '/');
		localStorage.setItem('archean-wiki-lang', newLang);
		window.location.href = newPath;
	}

	function createSelector() {
		var currentLang = getCurrentLang();
		var current = LANGUAGES.find(function(l) { return l.code === currentLang; });

		var container = document.createElement('div');
		container.className = 'lang-selector';

		var toggle = document.createElement('button');
		toggle.className = 'lang-selector-toggle';
		toggle.type = 'button';
		toggle.title = 'Language';
		toggle.setAttribute('aria-label', 'Select language');
		toggle.innerHTML = (current ? current.flag : '🇬🇧') + ' ' + (current ? current.label : 'English');

		var popup = document.createElement('div');
		popup.className = 'lang-selector-popup';

		LANGUAGES.forEach(function(lang) {
			var btn = document.createElement('button');
			btn.type = 'button';
			btn.innerHTML = lang.flag + '&nbsp;&nbsp;' + lang.label;
			if (lang.code === currentLang) {
				btn.className = 'active';
			}
			btn.addEventListener('click', function() {
				switchLang(lang.code);
			});
			popup.appendChild(btn);
		});

		toggle.addEventListener('click', function(e) {
			e.stopPropagation();
			popup.classList.toggle('open');
		});

		document.addEventListener('click', function() {
			popup.classList.remove('open');
		});

		container.appendChild(toggle);
		container.appendChild(popup);

		var rightButtons = document.querySelector('.right-buttons');
		if (rightButtons) {
			rightButtons.insertBefore(container, rightButtons.firstChild);
		}
	}

	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', createSelector);
	} else {
		createSelector();
	}
})();
