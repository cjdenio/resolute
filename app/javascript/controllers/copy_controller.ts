import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static values = {
		text: String,
	};
	static targets = ["button"];

	timeout: number | null;
	textValue: string;
	buttonTarget: HTMLElement;

	initialize() {
		this.timeout = null;
	}

	disconnect() {
		clearTimeout(this.timeout);
	}

	copy() {
		navigator.clipboard.writeText(this.textValue);

		this.buttonTarget.innerText = "Copied!";

		this.timeout = setTimeout(() => {
			this.buttonTarget.innerText = "Copy";
		}, 2000);
	}
}
