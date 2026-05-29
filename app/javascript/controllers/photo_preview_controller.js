// Ce controller Stimulus affiche le nom du fichier choisi à côté du bouton 📎 Photo
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // On cible le champ fichier et le span qui affiche le nom
  static targets = ["input", "name"]

  // Appelé quand l'utilisateur choisit un fichier
  showName() {
    const file = this.inputTarget.files[0]
    // Si un fichier est sélectionné, on affiche son nom, sinon on efface
    this.nameTarget.textContent = file ? file.name : ""
  }
}
