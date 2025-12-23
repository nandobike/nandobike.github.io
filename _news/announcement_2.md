---
layout: post
title: Website Migration to GitHub Pages with Cloudflare
date: 2025-12-21
inline: false
related_posts: false
---

I'm pleased to announce that this website has been successfully migrated from traditional web hosting to a modern static site setup using **GitHub Pages** with **Cloudflare** DNS management. The migration was completed with zero downtime for email services.

---

### Why the Migration?

After years of using traditional web hosting, I decided to modernize my personal website infrastructure for several reasons:

- **Better version control** - All content is now managed through Git
- **Automated deployments** - Changes are live within minutes via GitHub Actions
- **Improved performance** - Static site generation and Cloudflare CDN
- **Cost efficiency** - GitHub Pages is free for public repositories
- **Modern workflow** - Jekyll-based al-folio theme with built-in academic features

---

### Technical Implementation

#### Infrastructure Stack

- **Hosting**: GitHub Pages (static site hosting)
- **Domain registrar**: NIC Chile (.cl domain)
- **DNS provider**: Cloudflare (free tier)
- **Site generator**: Jekyll with al-folio theme
- **CI/CD**: GitHub Actions for automated builds
- **Email**: Gmail-hosted (maintained during migration)

#### Migration Steps

The migration process involved several key steps:

**1. DNS Provider Change**

Migrated from the previous hosting provider's nameservers to Cloudflare:

- Updated nameservers at NIC Chile registry to Cloudflare's NS
- Cloudflare automatically detected existing DNS records during setup
- All MX records for Gmail-hosted email were preserved

**2. Email Service Continuity**

The email configuration remained fully operational throughout:

- MX records were automatically imported by Cloudflare
- No changes to Gmail MX record priorities
- Zero downtime for email services
- SPF, DKIM, and DMARC records maintained

**3. Static Site Deployment**

Set up GitHub Pages with custom domain:

- Repository configured for GitHub Pages deployment
- Custom domain configured in repository settings
- CNAME file added to repository root
- DNS A records pointed to GitHub Pages IPs

**4. SSL/TLS Configuration**

Cloudflare provides automatic HTTPS:

- Universal SSL certificate issued automatically
- Full (strict) encryption mode enabled
- Automatic HTTP to HTTPS redirects configured
- HSTS enabled for enhanced security

---

### Benefits Realized

#### Performance Improvements

- **Global CDN**: Cloudflare's edge network serves content worldwide
- **Static content**: No server-side processing reduces latency
- **Automatic optimization**: Cloudflare handles minification and compression

#### Workflow Enhancements

- **Git-based workflow**: All changes tracked in version control
- **Automated builds**: GitHub Actions rebuilds site on every push
- **No FTP needed**: Direct git push to deploy
- **Markdown-based content**: Easy to write and maintain

#### Cost Savings

- **GitHub Pages**: Free for public repositories
- **Cloudflare**: Free tier includes DNS and CDN
- **SSL certificates**: Included at no cost
- **Previous hosting fee**: Eliminated

---

### Technical Notes for Others

If you're considering a similar migration, here are some helpful tips:

**DNS Migration**

- Cloudflare's auto-scan feature correctly identified all DNS records
- Allow 24-48 hours for nameserver propagation
- Keep old hosting active until DNS fully propagates
- Verify MX records are correct before shutting down old hosting

**GitHub Pages Setup**

- Use a CNAME file in your repository root for custom domains
- Configure DNS with A records pointing to GitHub's IPs (see GitHub documentation)
- Enable "Enforce HTTPS" in repository settings after DNS propagates
- Use GitHub Actions for automated Jekyll builds

**Email Considerations**

- MX records are independent of web hosting
- Email continues to work as long as MX records are correct
- Test email functionality before decommissioning old hosting
- Keep SPF records updated if changing providers

**Cloudflare Configuration**

- Use "Full (strict)" SSL mode for end-to-end encryption
- Enable "Always Use HTTPS" redirect
- Configure appropriate caching rules for static content
- Disable "Rocket Loader" if it conflicts with your site's JavaScript

---

### Lessons Learned

**What Went Well**

- Cloudflare's automatic DNS record detection was accurate
- Gmail MX records transferred seamlessly
- GitHub Actions deployment workflow was straightforward
- Zero downtime achieved for both web and email

**Challenges Encountered**

- Initial GitHub Actions workflow had a lighthouse plugin error (resolved by disabling)
- DNS propagation took ~6 hours for full global coverage
- Some local DNS caches required manual flushing

---

### Resources

For those interested in similar migrations:

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [al-folio Theme](https://github.com/alshedivat/al-folio)
- [Cloudflare DNS Setup Guide](https://developers.cloudflare.com/dns/)
- [Jekyll Static Site Generator](https://jekyllrb.com/)

---

The new setup provides a modern, maintainable, and performant platform for my academic website. The combination of GitHub Pages and Cloudflare offers excellent reliability and global reach at zero cost.

If you have questions about this migration or are considering something similar, feel free to reach out!
