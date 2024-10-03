public struct Response: Codable, Sendable {
	public struct Config: Codable, Sendable {
		/// The modalities for the response.
		let modalities: [Session.Modality]
		/// Instructions for the model.
		let instructions: String
		/// The voice the model uses to respond.
		let voice: Session.Voice
		/// The format of output audio.
		let output_audio_format: Session.AudioFormat
		/// Tools (functions) available to the model.
		let tools: [Session.Tool]
		/// How the model chooses tools.
		let tool_choice: Session.ToolChoice
		/// Sampling temperature.
		let temperature: Double
		/// Maximum number of output tokens.
		let max_output_tokens: Int?
	}

	public enum Status: String, Codable, Sendable {
		case failed
		case completed
		case cancelled
		case incomplete
		case in_progress
	}

	public struct Usage: Codable, Sendable {
		let total_tokens: Int
		let input_tokens: Int
		let output_tokens: Int
	}

	/// The unique ID of the response.
	let id: String
	/// The status of the response.
	let status: Status
	/// The list of output items generated by the response.
	let output: [Item]
	/// Usage statistics for the response.
	let usage: Usage?
}
