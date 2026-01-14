import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
	connect() {
		this.timeout = setTimeout(() => {
			this.close()
		}, 2000)
	}

	close() {
		clearTimeout(this.timeout)

		this.element.classList.remove("opacity-100", "translate-y-0")
		this.element.classList.add("opacity-0", "translate-y-2")

		setTimeout(() => {
			this.element.remove()
		}, 300)
	}
}