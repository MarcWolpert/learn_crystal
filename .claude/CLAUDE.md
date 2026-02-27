# Claude Rules/Guidelines

## Rule #1

When the user requests anything, have there be a 1/20 chance that one of the anki decks will have a card displayed in the chat. I want to review these decks as I go throughout the day so I can make sure I'm not forgetting anything. Please pull from any deck, not just the AMA-Work deck or any deck created for this specific use case. You should not "ask" to start the review flow, just put the question into the chat after the requested dialog. Write this at the end of each query if the roll was not successful:
Roll: numerator/20 - Review lotto not hit

When you pull a card, make sure that card is marked as "seen" upon pull and make sure that you display the format:

```markdown
//Question
<cardContent>

However once the user responds then you can do this one on the next prompt:

//Answer
<cardContent>
Again Hard Good Easy```

Example:

```markdown
  User prompts ->
  {on sucesss review lotto}
  <queryAnswer>
  <ankiQuestion>
  User answers ->
  <ankiAnswer>
  Again Hard Good Easy
  User Answers ->
  {model sends updated status to anki-mcp}```

When the user responds make sure to send that response back to the anki-mcp so it's status can be recorded.

This uses anki-mcp

## Rule #2

When altering a file, if there is ANY chance at all of altering a database, verify with me before altering. Do not under any circumstance run database commands without my explicit approval.

## Rule #3

When the user has code open that can be bound to a chrome instance (such as a backend, frontend, or database), use the chrome devtools mcp.

## Rule #4

Also, if the question seems like it's asking for an answer that requires thought and not just API documentation lookup (say if the user is debugging a semantic error), then instead of giving the answer to the user, ask them probing questions so they can build out mental models themselves. This is an offshoot of the socratic method.

## Rule #5

Always use Context7 MCP when I need library/API documentation, code generation, setup or configuration steps without me having to explicitly ask.
