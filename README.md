# A demo Rails app that runs inline JavaScript with Turbo rails and Content Security Policy (CSP)

This is a demo app that shows an issue with running inline JavaScript from an HTML that is shown by Turbo Rails when Content Security Policy (CSP) is enabled.

## Setup

```
bundle
```

## Run

```
rails s
```

## Steps to reproduce

* Open `http://127.0.0.1:3000/` in your browser.
* Click "Load content" link. It sends a [Turbo Stream](https://turbo.hotwired.dev/handbook/streams) request that replaces the content of the `#my_content` div with the content of `app/views/hello/show.turbo_stream.erb`. This content contains inline JavaScript that should be executed:

```
<%= javascript_tag nonce: true do %>
  console.log("Hello from JavaScript (turbo)!");
<% end %>
```

The `script` element contains the content security nonce attribute. This is required for inline JavaScript to work with Content Security Policy (CSP) enabled.

### Expected result

The JavaScript is executed and the message is printed to the browser console.

### Actual result

The JavaScript is not executed and the following error is printed to the browser console:

> turbo.es2017-esm.js:3270 Refused to execute inline script because it violates the following Content Security Policy directive: "script-src 'self' 'nonce-9pbW6zfl6WDrB2N4+TGevg=='". Either the 'unsafe-inline' keyword, a hash ('sha256-eYKIPd709b0rZh5meF1kOLkhDUFjfVrqdnDx8TcKRuw='), or a nonce ('nonce-...') is required to enable inline execution.

## The script works when run in a regular HTML page

Open http://127.0.0.1:3000/ and **right click** the "Load content" link. This will open the page in a separate tab sendind a normal HTTP request (not a Turbo Stream request). The JavaScript is executed and the message is printed to the browser console without any issues.
