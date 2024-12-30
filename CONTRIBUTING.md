# Contribution

## To submit a PR

We welcome contributions from the community! Here's how you can get involved:

1. Fork the Repository to your own GitHub account.

2. Create a new branch for your feature or bug fix. Make sure to create a meaningful branch name:

   ```bash
   git checkout -b <branch-name>
   ```

   _e.g., git checkout -b fix-bug-123, git checkout -b feature-new-method_

3. Make Changes

   - Make the necessary changes to the codebase.
   - Ensure your code adheres to the existing coding style and conventions.
   - Add tests for your changes to maintain high code quality.

4. Checking for Linting Offenses. Make sure all linting offenses are resolved:

   ```bash
   bundle exec rake analysis
   ```

5. Running Unit Tests and making sure all tests are passing:

   ```bash
   bundle exec rake test
   ```

6. Commit Your changes with clear & concise message

7. Push your changes to your forked repository:

   ```bash
    git push origin <branch-name>
   ```

8. Create a Pull Request

   - Create a pull request on this repository, targeting the `master` branch.
   - Provide a clear description of your changes and the problem they solve.

Thank you, contributors!

## Unit tests

We have create rake tasks for running test suites. The tests are divided into multiple files corresponding to the title they are testing against.

For example, to test a feature/method under `lib/titles/movie.rb` you will need to create a corresponding test for it under `test/titles/movie_test.rb`. And we follow similar pattern for all the titles.

If you do not want to run all the tests but only for a particular title, we have got you covered!

Testing _movie_ title:

```bash
bundle exec rake test_movie
```

Testing _tv-show_ title:

```bash
bundle exec rake test_tv
```

Testing _episode_ title:

```bash
bundle exec rake test_episode
```

Testing _game_ title:

```bash
bundle exec rake test_game
```

Testing _in-development_ title:

```bash
bundle exec rake test_title_in_development
```

Every time when we run the tests for a particular title we are making an HTTP request to the IMDb servers to receive the HTML response for that title to test data against.

Since making HTML requests is time consuming and resource intensive we are using [VCR cassettes](https://github.com/vcr/vcr) to store the responses. This saves a lot of development time.

The HTML responses are saved under the `test/fixtures/vcr_cassettes` directory. The name of the cassette file is the IMDb ID.
