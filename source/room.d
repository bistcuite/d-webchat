module room;

import vibe.vibe;

final class Room {
	string[] messages;
	LocalManualEvent messageEvent;

	this()
	{
		messageEvent = createManualEvent();
	}

	void addMessage(string name, string message)
	{
		messages ~= name ~ ": " ~ message;
		messageEvent.emit();
	}

	void waitForMessage(size_t next_message)
	{
		while (messages.length <= next_message)
			messageEvent.wait();
	}
}