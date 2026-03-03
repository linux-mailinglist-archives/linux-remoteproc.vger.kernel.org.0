Return-Path: <linux-remoteproc+bounces-6643-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH0VNq0pp2nSfAAAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6643-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Tue, 03 Mar 2026 19:34:21 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2BE1F55C0
	for <lists+linux-remoteproc@lfdr.de>; Tue, 03 Mar 2026 19:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDBFA3034DF4
	for <lists+linux-remoteproc@lfdr.de>; Tue,  3 Mar 2026 18:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3300042F56E;
	Tue,  3 Mar 2026 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ND6pc2ZI"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B203DBD42;
	Tue,  3 Mar 2026 18:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772562816; cv=none; b=o5FcHrCP7kUUw+ioPfnFneN5iJKBS5yhV2zRgmnhQ4hraj2Ri2GOsf2hjdBGP5iajadtwOHdIo+vb3Rl5QPuiC7KUKVeNgaiGVhdLQi3I3tmtMuPrnEacmUOcpN9iuC+NiLLcf/zeHXS7hFiaerNgQGxJ/J1RXJcWDbrdcB4QDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772562816; c=relaxed/simple;
	bh=1XuQcbjSVCUirvk12dolMLOBmrih8eIf7Wn8Zaw4luc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTMTi0JdRZbXEzZZUQ2Zm1IZhqVv+zDZcbq9TCdAo7nWR29xoo4ZAdeYd2Si9GxmEChn6D3WsuJ87O593ATiUgkyFeS7LJAuGatNFkpnNQUhYuwvcAvB+j55MH+X0mGeV1QvBodJ/hJqGDv2elFd1YUGx05TL0/IzVTPgpYbY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ND6pc2ZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46D0C116C6;
	Tue,  3 Mar 2026 18:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772562815;
	bh=1XuQcbjSVCUirvk12dolMLOBmrih8eIf7Wn8Zaw4luc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ND6pc2ZI9dCr8y35thKLLe1n03D75jTHm8LHrp2tPH9Ij32qeLq7O44XWO2zO2HEX
	 mmz7YGPrWwXlEQ2dosIuV1vjS0j4R3p0n2RSWRreWyozJ6V5o+I2izYVEPP+vOy/9k
	 +EZSmtYVF4GNSeGfKQGGGn/lKDapuPbAfrKuC8GO114moYRBg29hhfRUFkFRHmGcGD
	 VzAUA1RXbIBUq7asEhDVcRSrYv0iGXCFMnlnARZQK7KHpRq16h4SaSYcoGDnFozYIA
	 5li08ot6ehSrgm/AzV7Jw5gn+XNHzLFsJ5nmrtBUOGrPkB7vjAGBE0pEN7gI+m5YcX
	 DQP8TwRbWO6XA==
Date: Tue, 3 Mar 2026 18:33:29 +0000
From: Conor Dooley <conor@kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
Message-ID: <20260303-payphone-pancake-b6068c545bc3@spud>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
 <20260303-topic-am62a-ioddr-dt-v6-19-v1-2-12fe72bb40d2@baylibre.com>
 <20260303-hesitate-preoccupy-5e311cbd3e58@spud>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6LVnSUhtxOpmWqK3"
Content-Disposition: inline
In-Reply-To: <20260303-hesitate-preoccupy-5e311cbd3e58@spud>
X-Rspamd-Queue-Id: 5B2BE1F55C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6643-lists,linux-remoteproc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-remoteproc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-remoteproc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


--6LVnSUhtxOpmWqK3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 06:31:56PM +0000, Conor Dooley wrote:
> On Tue, Mar 03, 2026 at 04:13:00PM +0100, Markus Schneider-Pargmann (TI) =
wrote:
> > Add names to the memory-region-names for easier idenfitication of memory
> > regions.
> >=20
> > Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> > ---
> >  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml          | 19 +++++++++++=
++++++++
> >  1 file changed, 19 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rpr=
oc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> > index 6aadc61e20f9f4c27f5b9c87ab2025a02776c5de..76ef23afe8c9f7f155dfec7=
fcabc7c60b8b286c6 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> > @@ -182,6 +182,25 @@ patternProperties:
> >            - description: DM RM/PM trace and firmware code/data
> >          additionalItems: true
> > =20
> > +      memory-region-names:
> > +        description: |
> > +          Optional names for the memory regions specified in the memor=
y-region
>=20
> Is this really optional? Shouldn't it be made mandatory so that it is
> easy to tell the difference between the two configurations?

Actually, so that you can tell at all, since it looks like anything from
2 to 8 regions is permitted (which this prop doesn't account for I guess,
only allowing 2 or 6 regions).

>=20
> > +          property.
> > +        oneOf:
> > +          - description: Basic configuration with DMA and firmware reg=
ions
> > +            items:
> > +              - const: dma
> > +              - const: firmware
> > +
> > +          - description: Extended LPM configuration with split memory =
regions
> > +            items:
> > +              - const: dma
> > +              - const: ipc
> > +              - const: lpm-stub
> > +              - const: lpm-metadata
> > +              - const: lpm-context
> > +              - const: dm-firmware
> > +
> >  # Optional properties:
> >  # --------------------
> >  # The following properties are optional properties for each of the R5F=
 cores:
> >=20
> > --=20
> > 2.51.0
> >=20



--6LVnSUhtxOpmWqK3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaacpeQAKCRB4tDGHoIJi
0qvUAQDIPlBc+EDtI2V6+OdRXC2bz2e37Ro7IrXPjURmTTJnvwD/WCeUVsN2+kzS
aOee9x9jSExmzCwrrOKhv5ctzekeoQE=
=l+Px
-----END PGP SIGNATURE-----

--6LVnSUhtxOpmWqK3--

